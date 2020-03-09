import mapboxgl from 'mapbox-gl';


const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};
const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/abbyhudson/ck7iyy8o160ze1iodec472by9'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    const mapMarkers = []
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '25px';
      element.style.height = '25px';

      const newMarker = new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
      mapMarkers.push(newMarker)
    });
    fitMapToMarkers(map, markers);
    console.log(mapMarkers);

    openInfoWindow(mapMarkers);

  }
};

const openInfoWindow = (markers) => {
  const cards = document.querySelectorAll('.card-chip');
  cards.forEach((card, index) => {
    card.addEventListener('mouseenter', () => {
      markers[index].togglePopup();
    });
    card.addEventListener('mouseleave', () => {
      markers[index].togglePopup();
    });
  });
};


export { initMapbox };
