import Typed from 'typed.js';


const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Skis", "Snows", "Luges", "Skats"],
    typeSpeed: 120,
    loop: true
  });
}

export { loadDynamicBannerText };
