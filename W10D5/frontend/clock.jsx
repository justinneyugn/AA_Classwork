import React from 'react';

class Clock extends React.Component{
    constructor(){
        super();

        const date = new Date();
        this.state = {date: new Date()};
    }

    tick(){
        this.setState({date: new Date()});
    }

    componentDidMount(){
        this.intervalID = setInterval(() => this.tick(), 1000);
        console.log(this.intervalID)
    }

    render(){
        return (
            <h1>
                Clock
                <h4>Time:
                    <p>
                        {this.state.date.toLocaleTimeString()}
                    </p>
                </h4>
                <h4>Date:
                    <p>
                        {this.state.date.toLocaleDateString()}
                    </p>
                </h4>
            </h1>
        );
    }
}

export default Clock;