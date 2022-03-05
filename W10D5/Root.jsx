import React from 'react';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs';
import Weather from './frontend/weather';
import AutoComplete from './frontend/autocomplete';

const Root = (props) => {
    let tabz = [{content:"I am the first", title:"one"}, {content:"Second pane here", title:"two"}, {content:"Third pane here", title:"three"}];

    return (
        <div>
            <Clock />
            <Tabs something={tabz}/>
            <Weather />
            <AutoComplete />
        </div>
    )
} 

export default Root;

