mapboxgl.accessToken =
        "pk.eyJ1IjoidnVkbmsiLCJhIjoiY2w4MThyNTFwMGR1dDNubGt1bG41ZWFuayJ9.RYFLLBIY8BW9CyK9xm0clw";
const map = new mapboxgl.Map({
    container: "map", // container ID
    style: "mapbox://styles/mapbox/streets-v11", // style URL
    center: [108.32672179204343, 15.876701834599857], // starting position [lng, lat]
    zoom: 20, // starting zoom
    projection: "globe", // display the map as a 3D globe
});

//NavigationControl
const nav = new mapboxgl.NavigationControl({
    visualizePitch: true,
});
map.addControl(nav, "top-right");

var loc;

map.on("load", () => {
    map.addSource("station", {
        type: "geojson", //source location station
        data: "Geojson/station.json"
    });

    map.addLayer({
        id: "station",
        type: "symbol",
        source: "station",
        layout: {
            "icon-image": "{icon}",
            "icon-allow-overlap": true
        }
    });

    map.on("click", "station", (e) => {
        const coordinates = e.features[0].geometry.coordinates.slice();
        const description = e.features[0].properties.Descriptions;
        const title = e.features[0].properties.title;

        while (Math.abs(e.lngLat.lng - coordinates[0]) > 180) {
            coordinates[0] += e.lngLat.lng > coordinates[0] ? 360 : -360;
        }

        new mapboxgl.Popup()
                .setLngLat(coordinates)
                .setHTML(title)
                .setHTML(description)
                .addTo(map);
    });

});
