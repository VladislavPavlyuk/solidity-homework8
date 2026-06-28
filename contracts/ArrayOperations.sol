// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract ArrayOperations {

    // 2. Створюємо масив чисел зі стартовими значеннями 
    uint[] public mainNumbers = [5, 10, 15];

    // 3. Додаємо функцію для роботи з пам'яттю 
    function modifyMemoryCopy() public view returns (uint[] memory) {
        // Копіюємо масив зі стану (storage) у тимчасову змінну memory 
        uint[] memory copyNumbers = mainNumbers;
        
        // Змінюємо значення елементів локальної копії 
        for (uint i = 0; i < copyNumbers.length; i++) {
            copyNumbers[i] = copyNumbers[i] + 100; // Зміна відбувається лише в пам'яті 
        }
        
        // Повертаємо змінений масив 
        return copyNumbers; 
    }
    
    // 4. Вихідний масив "mainNumbers" у блокчейні залишається незмінним: [5, 10, 15]
}