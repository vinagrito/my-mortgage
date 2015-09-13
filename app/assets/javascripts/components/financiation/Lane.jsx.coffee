@Lane = React.createClass
  render: ->
    lineHeightCss = { "line-height": "0" }

    `<tr>
      <td>
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

      <td>
        <LaneTextInput addon="₪" placeholder="Amount" />
      </td>

      <td>
        <LaneTextInput addon="%" placeholder="Rate" />
      </td>

      <td>
        <LaneTextInput addon="₪" placeholder="Return (monthly)" />
      </td>

      <td>
        <div className="form-group">
          <input className="form-control floating-label" type="text" placeholder="Years"  />
        </div>
      </td>

      <td>
        <div className="form-group">
          <input className="form-control" id="disabledInput" type="text" disabled="disabled" placeholder="Bank gets" />
        </div>
      </td>

      <td>
        <a href="javascript:void(0)" className="btn btn-flat btn-danger" style={lineHeightCss}>
          <i className="mdi-action-delete" style={lineHeightCss}></i>
        </a>
      </td>
    </tr>`
