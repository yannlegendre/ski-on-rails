import Rails from 'rails-ujs';
import 'bootstrap';
import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css'
import { loadDynamicBannerText } from '../components/banner';

Rails.start();

const banner = document.querySelector('#banner-typed-text');
if (banner) {
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

