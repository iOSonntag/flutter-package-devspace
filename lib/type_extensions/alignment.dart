



part of devspace;

extension AlignmentExtension on Alignment {
  
  bool get maxAbsIsX => x.abs() >= y.abs();
  bool get maxAbsIsY => !maxAbsIsX;

  bool get maxAbsIsPositive => maxAbsIsX ? x >= 0 : y >= 0;
  bool get maxAbsIsNegative => !maxAbsIsPositive;


  /// Returns true if the alignment is in quadrant A given:
  /// 
  /// ```
  /// |  A  |  B  |
  /// |-----|-----|
  /// |  C  |  D  |
  /// ```
  bool get isA => x < 0 && y < 0;

  /// Returns true if the alignment is in quadrant B given:
  /// 
  /// ```
  /// |  A  |  B  |
  /// |-----|-----|
  /// |  C  |  D  |
  /// ```
  bool get isB => x >= 0 && y < 0;

  /// Returns true if the alignment is in quadrant C given:
  /// 
  /// ```
  /// |  A  |  B  |
  /// |-----|-----|
  /// |  C  |  D  |
  /// ```
  bool get isC => x < 0 && y >= 0;


  /// Returns true if the alignment is in quadrant D given:
  /// 
  /// ```
  /// |  A  |  B  |
  /// |-----|-----|
  /// |  C  |  D  |
  /// ```
  bool get isD => x >= 0 && y >= 0;



  /// Returns true if the alignment is in quadrant AB 
  /// 
  /// See [isA] for more information.
  bool get isAB => isA || isB;

  /// Returns true if the alignment is in quadrant BC
  /// 
  /// See [isA] for more information.
  bool get isBC => isB || isC;

  /// Returns true if the alignment is in quadrant CD
  /// 
  /// See [isA] for more information.
  bool get isCD => isC || isD;

  /// Returns true if the alignment is in quadrant AD
  /// 
  /// See [isA] for more information.
  bool get isAD => isA || isD;

  String get quadrant
  {
    if (isA) return 'A';
    if (isB) return 'B';
    if (isC) return 'C';
    if (isD) return 'D';
    return 'N/A';
  }
}