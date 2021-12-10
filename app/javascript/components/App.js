import React from "react"
import PropTypes from "prop-types"
class App extends React.Component {
  render () {
    return (
      <React.Fragment>
        Greeting: {this.props.greeting}
      </React.Fragment>
    );
  }
}

export default App
