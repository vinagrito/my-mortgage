@Lane = React.createClass
  clickDelete: ->
    @props.removeLane(@props.lane)

  valueChange: (field, newValue) ->
    @props.updateLane(@props.lane.id, {"#{field}": newValue })

  render: ->
    lineHeightCss = { "lineHeight": "0" }

    lane = @props.lane

    modality = lane.modality
    amount = lane.amount
    rate = lane.rate
    monthReturn = lane.monthReturn
    years = lane.years
    bankGain = lane.bankGain

    <tr>
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
        <LaneTextInput addon="₪" childRef="amount" placeholder="Amount" value={amount} valueChange={@valueChange} />
      </td>

      <td className="col-lg-1">
        <LaneTextInput ref="rate" childRef="rate" addon="%" placeholder="Rate" value={rate} valueChange={@valueChange} />
      </td>

      <td>
        <LaneTextInput childRef="monthReturn" addon="₪" placeholder="Return (monthly)"
          value={monthReturn} valueChange={@valueChange}/>
      </td>

      <td className="col-lg-1">
        <LaneTextInput childRef="years" placeholder="Years" value={years} valueChange={@valueChange} />
      </td>

      <td className="col-lg-2">
        <LaneTextInput childRef="bankGain" addon="₪" placeholder="Bank gets" disabled="disabled" value={bankGain}/>
      </td>

      <td>
        <div className="btn btn-flat btn-danger" style={lineHeightCss} onClick={@clickDelete}>
          <i className="mdi-action-delete" style={lineHeightCss}></i>
        </div>
      </td>
    </tr>
