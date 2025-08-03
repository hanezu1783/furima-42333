document.addEventListener("turbo:load", () => {
  const priceInput = document.getElementById("item-price"); // 販売価格入力欄
  const taxOutput = document.getElementById("add-tax-price"); // 手数料表示欄
  const profitOutput = document.getElementById("profit"); // 利益表示欄

  if (!priceInput) return; // このページに入力欄がなければ終了

  priceInput.addEventListener("input", () => {
    const price = parseInt(priceInput.value); // 入力値を整数に変換

    if (isNaN(price) || price < 300 || price > 9999999) {
      // 条件外は0円表示
      taxOutput.textContent = 0;
      profitOutput.textContent = 0;
      return;
    }

    const tax = Math.floor(price * 0.1); // 手数料(10%)切り捨て
    const profit = price - tax; // 利益計算

    taxOutput.textContent = tax.toLocaleString(); // カンマ区切りで表示
    profitOutput.textContent = profit.toLocaleString();
  });
});