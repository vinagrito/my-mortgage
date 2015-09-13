#= require_tree ./financiation

@Main = React.createClass
  getInitialState: ->
    laneCount: 0

  addLane: ->
    @setState laneCount: @state.laneCount + 1

  render: ->
    `<div>
      <h1>Welcome</h1>
      <a className="btn btn-flat btn-success" onClick={this.addLane}>+ Add Lane</a>

      <div className="row">
        <div className="col-lg-10">
          <LaneList laneCount={this.state.laneCount} />
        </div>
      </div>
    </div>`
