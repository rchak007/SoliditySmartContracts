pragma solidity ^0.5.0;

// lvl 3: equity plan
contract DeferredEquityPlan {
    address human_resources;

    address payable employee; // bob
    bool active = true;

    uint total_shares = 1000;
    uint annual_distribution = 250; // 1000 shares over 4 years

    uint public fakenow = now; // Will be used for testing
    // fakenow will be used instead of now for testing and later production deploymet will use use now 

    // uint start_time = now; // contract start time
    uint start_time = fakenow; 

    //uint unlock_time = now + 365 days; // will increment every year
    uint unlock_time = fakenow + 365 days;

    uint public distributed_shares; // starts at 0

    

    constructor(address payable _employee) public {
        human_resources = msg.sender;
        employee = _employee;
    }

    function distribute() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to execute this contract.");
        require(active == true, "Contract not active.");
        //require(unlock_time <= now, "Shares have not vested yet!");
        require(unlock_time <= fakenow, "Shares have not vested yet!");
        require(distributed_shares < total_shares, "All shares have been distributed.");

        unlock_time += 365 days; // lock for another year
        //distributed_shares = (now - start_time) / 365 days * annual_distribution; // calculate total shares from how many years have passed * annual_distribution
        distributed_shares = (fakenow - start_time) / 365 days * annual_distribution; // calculate total shares from how many years have passed * annual_distribution


        // double check in case the employee does not cash out until after 5+ years
        if (distributed_shares > 1000) {
            distributed_shares = 1000;
        }
    }

    // human_resources and the employee can deactivate this contract at-will
    function deactivate() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to deactivate this contract.");
        active = false;
    }

    // This function is used only for testing
    function fastforward() public {
    fakenow += 100 days;
    }

    function() external payable {
        revert("Do not send Ether to this contract!");
    }
}
