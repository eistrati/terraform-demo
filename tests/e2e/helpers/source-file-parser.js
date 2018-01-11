class SourceFileParser {
  constructor(config, index) {
    this.configModules = config.modules[index];
  }

  /**
   * @param {String} target
   * @returns {Object}
   */
  getTarget(target) {
    const resources = this.configModules.resources;
    const expr = new RegExp(target);
    const resource = Object.keys(resources).filter(r => expr.test(r))[0];
    return resources[resource];
  }

  /**
   * Get resource region
   * @param {String} target 
   * @returns {String}
   */
  getRegion(target) {
    const az = (this.getTarget(target)).primary.attributes.availability_zone;
    const [region] = az.match(SourceFileParser.regionPattern());

    return region;
  }
  static regionPattern() {
    return /[a-z]{2}-[a-z]{4,}-[0-9]{1}/gi;
  }
  
  /**
   * Get resource id
   * @param {String} target 
   * @returns {String}
   */

  getResourceId(target) {
    const filteredResourceId = this.getTarget(target);

    return filteredResourceId.primary.attributes.id;
  } 

  getRequiredArguments(target, reqArgKey) {
    const filteredResourceId = this.getTarget(target);

    return filteredResourceId.primary.attributes[reqArgKey];
  }
}

module.exports = {
  SourceFileParser
}
