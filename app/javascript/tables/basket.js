function ready(fn) {
  if (document.readyState !== "loading"){
    fn();
  } else {
    document.addEventListener("DOMContentLoaded", fn);
    
  }
}
function showUpdateQuantityBtn(e) {
  const productId = e.currentTarget.dataset.product;
  const btnId = "update_quantity_product_" + productId;
  const btnUpdateQuantity = document.getElementById(btnId);
  const quantityHeader = document.getElementById("quantity_header");

  btnUpdateQuantity.classList.remove("hidden");
  quantityHeader.attributes.colspan.value = 2;
};

ready(function(){
  const quantitySelectors = Array.from(document.getElementsByClassName("quantity"));

  if(quantitySelectors){
    quantitySelectors.forEach(function (selector) {
      selector.addEventListener("change", showUpdateQuantityBtn);
    });
  }
});