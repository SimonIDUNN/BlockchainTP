pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
/**
 * This is an access control role for entities that may spend tokens
 */

contract ERC20Spendable is ERC20 {
    constructor() ERC20("EPFToken", "EPF") public { }
    /**
     * @dev For testing purposes, this allows anybody to mint tokens. Simply
     *     remove this line for production use so the ERC20Mintable contract
     *     can provide a more secure minter role.
     */
    function spend(address from, uint256 value)
    public
    /*onlySpender*/
    returns (bool)
  {
    _burn(from, value);
    return true;
  }

    function mint(address to, uint256 value) 
        public 
        /*onlyMinter*/
        returns (bool)
    {
        _mint(to, value);
        return true;
    }
}
