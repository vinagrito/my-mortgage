@LaneList = React.createClass
  getInitialState: ->
    lanes: @props.lanes

  handleRemoveLane: (lane)->
    @props.onRemoveClick(lane)

  render: ->
    lanes = for lane in @props.lanes
      `<Lane key={lane.id} lane={lane} onRemove={this.handleRemoveLane} />`

    `<tbody>
      { lanes }
    </tbody>`
