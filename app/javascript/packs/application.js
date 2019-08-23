import Rails from 'rails-ujs';
import 'bootstrap';
import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css'
import { loadDynamicBannerText } from '../components/banner';
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';

const map = document.querySelector('#map');
if (map) {
  initMapbox();
}

Rails.start();

const banner = document.querySelector('#banner-typed-text');
if (banner) {
  console.log('je suis la')
  loadDynamicBannerText();
}


const calendar = document.querySelector('#calendar');
if (calendar) {
  const datesBooked = calendar.dataset.datesBooked
  flatpickr("#transaction_rental_date",
  {
    minDate: "today",
    disable: JSON.parse(datesBooked),
    dateFormat: "d-m-Y"
  });
}

