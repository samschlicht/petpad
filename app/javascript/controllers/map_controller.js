import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
    container: this.element,
    style: 'mapbox://styles/samschlicht/cldk63onz000101r317yda29m', // style URL
  });
    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const customMarker = document.createElement("div")
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      customMarker.innerHTML = marker.marker_html

      // Pass the element as an argument to the new marker
      new mapboxgl.Marker({element: customMarker})
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map);
    })
  }


  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
