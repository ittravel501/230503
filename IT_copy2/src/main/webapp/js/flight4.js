
  
  function submitFlightForm() {
    var selectedPriceElement = document.getElementById('selectedPrice');
    var selectedPrice = parseInt(selectedPriceElement.innerText);

    var flightForm = document.getElementById('flightForm');

    // 선택된 가격을 폼에 추가
    var priceInput = document.createElement('input');
    priceInput.setAttribute('type', 'hidden');
    priceInput.setAttribute('name', 'selectedPrice');
    priceInput.setAttribute('value', selectedPrice);

    flightForm.appendChild(priceInput);

    // 폼 제출
    flightForm.submit();
}