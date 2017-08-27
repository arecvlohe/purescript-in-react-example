import React, { Component } from "react";

import PSCounter from "./PureScript/output/Counter";

class App extends Component {
  render() {
    const state = { ...this.props };
    const Counter = PSCounter.toReact(state)();
    return (
      <div className="App">
        <Counter />
      </div>
    );
  }
}

export default App;
