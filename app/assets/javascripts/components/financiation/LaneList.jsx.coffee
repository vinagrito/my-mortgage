@LaneList = React.createClass
  getInitialState: ->
    lanes: @props.lanes
    total: { amount: 0, monthReturn: 0, bankGain: 0 }

  handleRemoveLane: (lane)->
    @props.onRemoveClick(lane)

  updateLane: (laneID, value) ->
    lanes = @state.lanes
    currentLane = lanes.find (lane) -> lane.id is laneID
    laneIndex = lanes.indexOf(currentLane)

    lanes.splice(laneIndex, 1)
    $.extend(currentLane, value)
    lanes.splice(laneIndex, 0, currentLane)

    @setState lanes: lanes
    @updateTotalFinanciation()

  updateTotalFinanciation: ->
    total = @props.lanes.reduce (prev, curr) ->
      {
        amount: prev.amount + parseInt(curr.amount),
        monthReturn: prev.monthReturn + parseInt(curr.monthReturn),
        bankGain: prev.bankGain + parseInt(curr.bankGain),
      }
    , { amount: 0, monthReturn: 0, bankGain: 0 }

    @setState total: total

  render: ->
    lanes = for lane in @props.lanes
      `<Lane key={lane.id} lane={lane} onRemove={this.handleRemoveLane} updateLane={this.updateLane}/>`

    `<tbody>
      { lanes }
      <TotalFinanciation total={this.state.total} />
    </tbody>`
