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
    }

    render(){
        return (
            <h1>
                Clock
                <label>Time
                    <p>
                        {this.state.date.toLocaleTimeString()}
                    </p>
                </label>
                <label>Date
                    <p>
                        {this.state.date.toLocaleDateString()}
                    </p>
                </label>
            </h1>
        );
    }
}

export default Clock;