pragma solidity ^0.4.2;

contract DappToken {

  uint256 public totalSupply;
  string public name = 'micheal';
  string public symbol = 'mgg';
  string public standard = 'micheal Token v1.0';

  event Transfer(
      address indexed _from,
      address indexed _to,
      uint256 _value
  );

  mapping(address => uint256) public balanceOf;

  constructor(uint256 _initialSupply) public {
      balanceOf[msg.sender] = _initialSupply;
      totalSupply = _initialSupply;
  }

  function transfer(address _to, uint256 _value) public returns (bool success) {
      require(balanceOf[msg.sender] >= _value);

      balanceOf[msg.sender] -= _value;
      balanceOf[_to] += _value;

      emit Transfer(msg.sender, _to, _value);

      return true;
  }

}
