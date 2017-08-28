import React, { Component } from "react";

import PSCounter from "./PureScript/output/Counter";

class App extends Component {
  render() {
    const Counter = PSCounter.toReact(this.props)();
    return (
      <div className="App">
        <Counter />
      </div>
    );
  }
}

export default App;
