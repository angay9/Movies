"use strict";
var Movies = {
    App: {
        services: [],
        resolve: function (key) {
            var filtered = this.services.filter(function (o, idx) { return o.key === key });
            return filtered.length > 0 ? filtered[0] : null;
        },
        bind: function (key, object, shared) {
            var existingKeys = this.services.filter(function (el, idx) { return el.key === key });
            if (existingKeys.length > 0)
                throw new Error("Container already has a binding with this key");

            var binding = new Binding(key, object);
            this.services.push(binding);
        },
    }
}

var Binding = function (key, object) {
    this.key = key;
    this.object = object;
}