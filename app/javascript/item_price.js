const price = () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 10);
  const addProfit = document.getElementById("profit");
    addProfit.innerHTML = Math.floor(inputValue - inputValue / 10);
})
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
