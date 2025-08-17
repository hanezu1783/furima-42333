const pay = () => {
  const numberForm = document.getElementById('number-form');
  const expiryForm = document.getElementById('expiry-form');
  const cvcForm = document.getElementById('cvc-form');
  const form = document.getElementById('charge-form');

  if (!numberForm || !expiryForm || !cvcForm || !form) return; // フォームがない場合は何もしない

  const payjp = Payjp(gon.public_key);
  const elements = payjp.elements();

  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  // 安全に mount
  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  form.addEventListener("submit", async (e) => {
    e.preventDefault();

    payjp.createToken(numberElement).then(function(response) {
      let token = "";

      if (response.error) {
        token = "";
      } else {
        token = response.id;
      }


      const tokenInput = document.createElement('input');
      tokenInput.setAttribute('type', 'hidden');
      tokenInput.setAttribute('name', 'order_address[token]')
      tokenInput.setAttribute('value', token);
      form.appendChild(tokenInput);

      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();

      form.submit();
    });
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);