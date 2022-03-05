import React from 'react';

class Tabs extends React.Component{
    constructor(props) {
        super(props);

        this.state = {selected: 0};
        this.props = props;
    }

    change(i) {
        this.setState({selected: i});
    }

    render() {
        const allTabs = this.props.something.map( (tab, i) => {
            return (
                <h1 key={tab.title} onClick={() => this.change(i)}>
                    {tab.title}
                </h1>
            )
        })
        return (
            <ul>
                {allTabs}
                <p> {this.props.something[this.state.selected].content}</p>
            </ul>
        )
    }
}

export default Tabs;