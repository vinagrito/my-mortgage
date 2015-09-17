@Lane = React.createClass
  getInitialState: ->
    @props.lane

  clickDelete: ->
    @props.onRemove(@props.lane)

  updateMonthReturn: ->
    rate = @state.rate / 100
    monthReturn = ((rate / 12) * @state.amount) / (1 - (Math.pow((1 + (rate / 12)), (-@state.years * 12))))
    Math.round(monthReturn * 100) / 100

  valueChange: (field, newValue) ->
    @props.updateLane(@props.lane.id, {"#{field}": newValue})

  bankGain: ->
    gain = @updateMonthReturn() * @state.years * 12
    Math.round(gain * 100) / 100

  render: ->
    lineHeightCss = { "lineHeight": "0" }

    modality = @state.modality
    amount = @state.amount
    rate = @state.rate
    monthReturn = @updateMonthReturn()
    years = @state.years
    bankGain = @bankGain()

    `<tr>
      <td className="col-lg-3">
        <div className="form-group">
          <div>
            <select className="form-control" id="select">
              <option value="-1">Choose a modality</option>
              <option>Variant (Tied to inflation)</option>
              <option>Prime</option>
              <option>Ogen</option>
              <option>Fixed (Tied to inflation)</option>
              <option>Fixed (Not tied to inflation)</option>
            </select>
          </div>
        </div>
      </td>

      <td className="col-lg-2">
        <LaneTextInput addon="₪" placeholder="Amount" value={amount} valueChange={this.valueChange} />
      </td>

      <td className="col-lg-1">
        <LaneTextInput ref="rate" childRef="rate" addon="%" placeholder="Rate" value={rate} valueChange={this.valueChange} />
      </td>

      <td>
        <LaneTextInput ref="monthReturn" childRef="monthReturn" addon="₪"
          placeholder="Return (monthly)" value={monthReturn} valueChange={this.valueChange}/>
      </td>

      <td className="col-lg-1">
        <LaneTextInput ref="years" childRef="years" placeholder="Years" value={years} valueChange={this.valueChange} />
      </td>

      <td className="col-lg-2">
        <LaneTextInput ref="bankGain" childRef="bankGain" addon="₪" placeholder="Bank gets" disabled="disabled" value={bankGain}/>
      </td>

      <td>
        <div className="btn btn-flat btn-danger" style={lineHeightCss} onClick={this.clickDelete}>
          <i className="mdi-action-delete" style={lineHeightCss}></i>
        </div>
      </td>
    </tr>`
