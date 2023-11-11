window.addEventListener('turbo:load', () => {
  const princeInput = document.getElementById("item-price");
  
  princeInput.addEventListener("input", () => {

    const inputValue = princeInput.value;

    const addTax = Math.floor(inputValue * 0.1)

    const profit = inputValue - addTax;
    
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = addTax;

    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = profit;
  });
});