




function truncateText() {
  var longTextElements = document.querySelectorAll(".name-product");
  var maxLength = 20;

  longTextElements.forEach(function (element) {
    var originalText = element.innerText;

    if (originalText.length > maxLength) {
      var truncatedText = originalText.substring(0, maxLength) + "...";
      element.innerText = truncatedText;
    }
  });
}
truncateText();









