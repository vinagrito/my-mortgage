@LaneTextInput = React.createClass
  valueChange: ->
    @props.valueChange(@props.childRef)

  render: ->
    React.DOM.div
      className: "form-group"

      React.DOM.div
        className: "input-group"

        if @props.addon isnt undefined
          React.DOM.span
            className: "input-group-addon"
            @props.addon

        React.DOM.input
          id: "focusedInput"
          ref: @props.childRef
          className: "form-control floating-label"
          type: "text"
          placeholder: @props.placeholder
          "data-hint": @props.dataHint
          defaultValue: @props.value
          value: @props.value
          disabled: @props.disabled
          onChange: @valueChange
