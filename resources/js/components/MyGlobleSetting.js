class MyGlobleSetting {
    constructor() {
        this.url = 'http://127.0.0.1:8000';
    }

    getParameterByName(name) {
        var match = RegExp('[#&]' + name + '=([^&]*)').exec(window.location.hash);
        return match && decodeURIComponent(match[1].replace(/\+/g, ' '));
    }

    getAccessToken() {
        var  at;

        if (this.getParameterByName('access_token')) {
           localStorage.setItem('at', this.getParameterByName('access_token'));
            at =  this.getParameterByName('access_token');
        }else{
            at =  localStorage.getItem('at');
        }

        return at;
    }

    getIdToken() {
        return this.getParameterByName('id_token');
    }
}

export default (new MyGlobleSetting);

