import Typed from 'typed.js';
const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["skis", "snows", "luges"],
    typeSpeed: 120,
    loop: true
  });
}
export { loadDynamicBannerText };
