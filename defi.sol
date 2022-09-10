// SPDX-License-Identifier: GPL-3.0

//  ███╗░░░███╗██╗███╗░░██╗███████╗░██████╗░██╗░░░░░░░██╗███████╗███████╗██████╗░███████╗██████╗░
//  ████╗░████║██║████╗░██║██╔════╝██╔════╝░██║░░██╗░░██║██╔════╝██╔════╝██╔══██╗██╔════╝██╔══██╗
//  ██╔████╔██║██║██╔██╗██║█████╗░░╚█████╗░░╚██╗████╗██╔╝█████╗░░█████╗░░██████╔╝█████╗░░██████╔╝
//  ██║╚██╔╝██║██║██║╚████║██╔══╝░░░╚═══██╗░░████╔═████║░██╔══╝░░██╔══╝░░██╔═══╝░██╔══╝░░██╔══██╗
//  ██║░╚═╝░██║██║██║░╚███║███████╗██████╔╝░░╚██╔╝░╚██╔╝░███████╗███████╗██║░░░░░███████╗██║░░██║
//  ╚═╝░░░░░╚═╝╚═╝╚═╝░░╚══╝╚══════╝╚═════╝░░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝╚═╝░░░░░╚══════╝╚═╝░░╚═╝

// If a player wants to play the game without staking, we would give him a fake ERC-20 dummy token to start with
pragma solidity ^0.8.10;

contract factory{
    //global variables

    address playerA,playerB;
    uint256 gameState = 0;
    mapping(address => bool) gameExists;
    mapping(address => uint256) amountStaked;



    //events
    event gameCreated( address indexed player1, address indexed amountA  );

    constructor( ){
        playerA = msg.sender;
        gameState = 
    }

    function createNewGame payable public (){
        // check the gameExists mapping
        // set the amountStaked mapping
        // emit gameCreated event
    }

     
    function joinGame( address _playerA ){
        //This function will take address of the player who created the game.
        //This new player will be able to join this game only if he commits to a amount greater than or equal to what playerA commited
        require( msg.value => amountStaked[address]);
        // A mapping to begin the game maybe?
    } 
    
    function returnRandomNumber( ) returns(uint256){
        //////
    }


    

}

