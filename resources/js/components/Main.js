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

        axios.get(MyGlobleSetting.url + '/api/stops?lat=31.57&lng=74.36', {headers: headers})
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
                    {stop.name}
                    <div id={stop.id + '_register'}>
                    { (typeof stop.users[0]) !== 'undefined' && stop.users[0].user_id == userid ? ('Registered') : (<a href="javascript:void(0)" onClick={(e) => this.registerBus(userid,stop.id, e)}>Register</a>)  }
                </div>

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

    registerBus(user_id,stop_id) {
        var r = confirm("Are you sure? You want to register?");
        if (r == true) {
            var headers = {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ' + MyGlobleSetting.getAccessToken()
            }

            axios.post(MyGlobleSetting.url + '/api/stops/register', {
                'user_id' : user_id,
                'stop_id' : stop_id
            },{ headers: headers,})
                .then(response => {
                    console.log(response);
                    if (response.data.status == "1") {
                        document.getElementById(response.data.stop_id + '_register').innerHTML = "Registered";
                    }

                })
                .catch(function (error) {
                    console.log(error);
                });
        }

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