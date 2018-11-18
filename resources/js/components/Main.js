import React, {Component} from 'react';
import ReactDOM from 'react-dom';
import axios from 'axios';
import MyGlobleSetting from './MyGlobleSetting';

/* Main Component */
class Main extends Component {

    constructor() {

        super();
        //Initialize the state in the constructor
        this.state = {
            stops: [],
        }
    }


    componentDidMount() {
        var headers = {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + MyGlobleSetting.getAccessToken()
        }

        axios.get(MyGlobleSetting.url + '/api/stops?lat=31.24&lng=74.21', {headers: headers})
            .then(response => {
                this.setState({stops: response.data});
            })
            .catch(function (error) {
                console.log(error);
            })
    }


    renderStops() {
        console.log(this.state.stops);

        return this.state.stops.map(stop => {
            return (
                /* When using list you need to specify a key
                 * attribute that is unique for each list item
                */

                <li key={stop.id}>
                    {stop.name} - <a href="javascript:void(0)" onClick={(e) => this.registerBus(userid,stop.id, e)}>Register</a>
                    <ul>
                        {
                            stop.buses.map(bus => {
                                return (
                                    <li>
                                        {bus.name} - Arrive at {bus.pivot.arrival_time}
                                    </li>
                                )
                            })
                        }
                    </ul>
                </li>
            );
        })
    }

    registerBus(user_id,bus_id) {
        // TODO POST - API call with token to store data into pivot table user_stop.
    }


    /*componentDidMount() is a lifecycle method
     * that gets called after the component is rendered
     */

    render() {
        /* Some css code has been removed for brevity */
        return (
            <div>
                <h4>Bus stops near by :-</h4>

                <ul>
                    {this.renderStops()}
                </ul>
            </div>

        );
    }
}

if (document.getElementById('spa-app')) {
    ReactDOM.render(<Main/>, document.getElementById('spa-app'));
}