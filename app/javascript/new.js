window.addEventListener("load", () =>{

  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener( 'input',() => {
    const price = itemPrice.value;

    const taxPrice = document.getElementById("add-tax-price");
    const tax = (Math.floor( price * 0.1 ));
    taxPrice.innerHTML = tax;

    const profit = document.getElementById("profit");
    const pro = (Math.floor( price * 0.9));
    profit.innerHTML = pro;
  });
});