pragma solidity ^0.4.10;

import 'browser/ERC223ReceivingContract.sol';
import 'browser/SafeMath.sol';
import 'browser/StandardToken.sol';

contract Crowdsale {
    using SafeMath for uint;
    StandardToken public token;
    uint public price;
    
    event Buy(address _beneficiary, uint _amount);
    
    function Crowdsale() public {
        token = new StandardToken("Howest Dollar", "HWD", 2, 2000000);
        price = 1 ether;
    }

    //Fallback
    function() public payable {
        revert();
    }
    
    function buy() public payable {
        return buyFor(msg.sender);
    }
    
    function buyFor(address _beneficiary) public payable{
        uint amount = msg.value.div(price);
        token.transfer(_beneficiary, amount);
        Buy(_beneficiary, amount);
    }
}