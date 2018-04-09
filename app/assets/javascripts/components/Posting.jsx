class Posting extends React.Component {
  render() {

    // const image = cl_image_tag(this.props.meal_posting.media[0].url, class: 'media-object')
    const image = 'test'
    const serving_time = this.props.meal_posting.end_time ? "${this.props.meal_posting.base_time} - ${this.props.meal_posting.end_time}":
    "${this.props.meal_posting.base_time}";

    return (
    <div>
      <div class="meal-div">
        <div class="media">
          <div class="media-left media-middle">
            {image}
          </div>

          <div class="media-body">
            <div class="container-fluid media-container">

              <div class="row row-heading">
                <div class="col-xs-4">
                  {this.props.meal_posting.title}
                </div>

                <div class="col-xs-4">
                {serving_time}
                </div>

                <div class="col-xs-4">
                  Cost: ${this.props.meal_posting.cost}
                </div>
              </div>

              <div class="row row-body">
                <div class="col-xs-12">
                  {this.props.meal_posting.description}
                </div>
              </div>

              <div class="row row-footer">
                <div class="col-xs-4">
                  Servings Left: {this.props.meal_posting.servings}
                </div>
                <div class="col-xs-8">
                  Allergies: {this.props.meal_posting.allergy_notice}
                </div>
              </div>

            </div>
          </div>

        </div>
      </div>
    </div>
    )
  }
}

export default Posting;