//SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

contract Twitter{

    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    mapping(address => Tweet[]) public tweets;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function createTWeet(string memory _tweet) public {
        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);

    }

    function getUserTweets(uint256 _id)public view returns(Tweet memory) {
        return tweets[msg.sender][_id];
    }

    function getAllTweets(address _owner) public view returns(Tweet[] memory){
        return tweets[_owner];
    }

    function likeTweet(address _author, uint256 _id) public {
        require(tweets[_author][_id].id == _id, "TWEET DOES NOT EXIST");
        tweets[_author][_id].likes++;
    }
    function unlikeTweet(address _author, uint256 _id)public {
        require(tweets[_author][_id].id == _id, "TWEET DOES NOT EXIST");
        require(tweets[_author][_id].likes > 0, "Tweet has no like");
        tweets[_author][_id].likes--;
    }
}