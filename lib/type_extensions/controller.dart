part of devspace;


extension ExtensionOnPageController on PageController {

  int get currentPage => hasClients ? page?.round() ?? 0 : 0;

}