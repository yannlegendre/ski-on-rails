
import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css'

// import { loadDynamicBannerText } from '../components/banner';
// loadDynamicBannerText();

const calendar = document.querySelector('#calendar')
const datesBooked = calendar.dataset.datesBooked
flatpickr("#transaction_rental_date",
{
  minDate: "today",
  disable: JSON.parse(datesBooked),
  dateFormat: "d-m-Y",
});

