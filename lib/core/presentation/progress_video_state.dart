enum ProcessedVideoState {
  save,
  compress,
  upload,
  result,
  error,
  none;

  static ProcessedVideoState parse(String name) {
    switch (name) {
      case 'save':
        return ProcessedVideoState.save;
      case 'compress':
        return ProcessedVideoState.compress;
      case 'upload':
        return ProcessedVideoState.upload;
      case 'result':
        return ProcessedVideoState.result;
      case 'error':
        return ProcessedVideoState.error;
      case 'none':
        return ProcessedVideoState.none;
      default:
        return ProcessedVideoState.none;
    }
  }

  @override
  String toString() => name;
}
