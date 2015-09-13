@LaneTextInput = React.createClass
  render: ->
    React.DOM.div
      className: "form-group"

      React.DOM.div
        className: "input-group"

        if @props.addon isnt ""
          React.DOM.span
            className: "input-group-addon"
            @props.addon

        React.DOM.input
          className: "form-control floating-label"
          type: "text"
          placeholder: @props.placeholder
          defaultValue: @props.value
