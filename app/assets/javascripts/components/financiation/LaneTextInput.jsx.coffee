@LaneTextInput = React.createClass
  valueChange: (e) ->
    if @props.valueChange
      @props.valueChange(@props.childRef, e.target.value)

  render: ->
    React.DOM.div
      className: "form-group"

      React.DOM.div
        className: "input-group"

        if @props.addon
          React.DOM.span
            className: "input-group-addon"
            @props.addon

        React.DOM.input
          id: "focusedInput"
          name: "financiation[lane_attributes][][#{@props.placeholder}]"
          className: "form-control floating-label"
          type: "text"
          placeholder: @props.placeholder
          "data-hint": @props.dataHint
          value: @props.value
          disabled: @props.disabled
          onChange: @valueChange
