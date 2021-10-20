function ready(fn) {
  if (document.readyState !== "loading"){
    fn();
  } else {
    document.addEventListener("DOMContentLoaded", fn);
    
  }
}
// function updateQuanity(e) {
function showUpdateQuantityBtn(e) {
  const productId = e.currentTarget.dataset.product;
  const btnId = "update_quantity_product_" + productId;
  const btnUpdateQuantity = document.getElementById(btnId);
  
  btnUpdateQuantity.classList.remove("hidden");
};

ready(function(){
  const quantitySelectors = Array.from(document.getElementsByClassName("quantity"));

  if(quantitySelectors){
    quantitySelectors.forEach(function (selector) {
      selector.addEventListener("change", showUpdateQuantityBtn);
    });
  }
});