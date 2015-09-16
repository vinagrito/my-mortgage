@Lane = React.createClass
  getInitialState: ->
    @props.lane

  clickDelete: ->
    @props.onRemove(@props.lane)

  valueChange: (field) ->
    newValue = @refs[field].refs[field].getDOMNode().value
    @setState "#{field}": newValue
    @props.updateTotal(@props.lane.id, {"#{field}": newValue})

  render: ->
    lineHeightCss = { "lineHeight": "0" }

    modality = this.state.modality
    amount = this.state.amount
    rate = this.state.rate
    monthReturn = this.state.monthReturn
    years = this.state.years

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
        <LaneTextInput ref="amount" childRef="amount" addon="₪" placeholder="Amount" value={amount} valueChange={this.valueChange} />
      </td>

      <td className="col-lg-1">
        <LaneTextInput ref="rate" childRef="rate" addon="%" placeholder="Rate" value={rate} />
      </td>

      <td style={{"width": "200px"}}>
        <LaneTextInput ref="monthReturn" childRef="monthReturn" addon="₪"
          placeholder="Return (monthly)" value={monthReturn} valueChange={this.valueChange} />
      </td>

      <td className="col-lg-1">
        <LaneTextInput ref="years" childRef="years" placeholder="Years" value={years}  />
      </td>

      <td className="col-lg-2">
        <LaneTextInput ref="bankGain" childRef="bankGain" addon="₪" placeholder="Bank gets" disabled="disabled" />
      </td>

      <td>
        <div className="btn btn-flat btn-danger" style={lineHeightCss} onClick={this.clickDelete}>
          <i className="mdi-action-delete" style={lineHeightCss}></i>
        </div>
      </td>
    </tr>`
