// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Rectangle {

    // Змінні стану 
    uint public width;
    uint public height;

    // Функція для встановлення розмірів (змінює стан, тому без view/pure)
    function setDimensions(uint _width, uint _height) public {
        width = _width;
        height = _height;
    }

    // 2. Функція area() 
    // Видимість: public (доступна звідусіль) 
    // Модифікатор: view, тому що вона ЧИТАЄ змінні стану width та height 
    function area() public view returns (uint) { 
        return width * height;
    }

    // 2. Функція perimeter() 
    // Видимість: external (виклик тільки ззовні контракту, економить газ) 
    // Модифікатор: view, оскільки також зчитує стан блокчейну 
    function perimeter() external view returns (uint) { 
        return 2 * (width + height);
    }

    // 2. Функція isSquare() 
    // Видимість: public 
    // Модифікатор: pure, тому що вона взагалі НЕ читає і НЕ змінює стан контракту, а працює лише з вхідними параметрами 
    function isSquare(uint _w, uint _h) public pure returns (bool) { 
        return _w == _h;
    }
}