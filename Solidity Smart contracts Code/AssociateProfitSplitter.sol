pragma solidity ^0.5.0;


import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";

// lvl 1: equal split
contract AssociateProfitSplitter {
    using SafeMath for uint;
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    address payable public employee_one;
    address payable public employee_two;
    address payable public employee_three;
    //uint public employees = 3;

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        // @TODO: Split `msg.value` into three
        // Your code here!
        uint amount = msg.value.div(3); 

        // @TODO: Transfer the amount to each employee
        // Your code here!
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        // Your code here!
        uint left_over = msg.value - ( amount * 3 );
        if ( left_over > 0 ) {
            msg.sender.transfer(left_over);
        }
    }

    function() external payable {
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        // Your code here!
        deposit();
    }
}

