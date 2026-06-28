// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Calculator {

    // 2. Реалізуємо функцію sumArray 
    // Видимість external, оскільки функція призначена для виклику лише ззовні 
    // Модифікатор pure, бо функція не зчитує змінні стану контракту 
    function sumArray(uint[] calldata _arr) external pure returns (uint) { // 3. Приймає масив через calldata 
        uint sum = 0;
        
        // Обчислюємо суму всіх елементів 
        for (uint i = 0; i < _arr.length; i++) {
            sum += _arr[i];
        }
        
        return sum; // Повертаємо отриманий результат 
    }
}