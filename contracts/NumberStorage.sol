// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract NumberStorage {
    
    // 2. Створюємо динамічний масив чисел 
    uint[] public numbers;

    // 3. Функція заповнення масиву кількома числами 
    function fillArray() public {
        numbers.push(10);
        numbers.push(20);
        numbers.push(30);
    }

    // 4. Створюємо функцію подвоєння значень 
    function doubleValues() public {
        // 5. Створюємо локальну змінну типу storage, яка посилається на глобальний масив 
        uint[] storage myNumbersStorage = numbers;
        
        // Збільшуємо кожен елемент масиву у 2 рази 
        for (uint i = 0; i < myNumbersStorage.length; i++) {
            myNumbersStorage[i] = myNumbersStorage[i] * 2; // Зміни записуються прямо в стан блокчейну 
        }
    }
    // 6. Після виклику цієї функції, якщо перевірити масив через публічний "numbers", значення зміняться на 20, 40, 60 
}